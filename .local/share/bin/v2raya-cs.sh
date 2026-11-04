#!/usr/bin/env bash
# Get the servers currently stored in a v2rayA subscription.
# Usage: ./v2raya-subscription.sh [subscription_id]

set -euo pipefail

V2RAYA_URL="${V2RAYA_URL:-http://127.0.0.1:2017}"
OUTBOUND="${1:-proxy}"

TOKEN=$(
  curl -fsS -X POST "$V2RAYA_URL/api/login" \
    -H 'Content-Type: application/json' \
    -d "{\"username\":\"$V2RAYA_USER\",\"password\":\"$V2RAYA_PASS\"}" |
  jq -r '.data.token'
)

TOUCH_JSON=$(
  curl -fsS "$V2RAYA_URL/api/touch" \
    -H "Authorization: Bearer $TOKEN"
)

RUNNING=$(
  jq -r '.data.running // false' <<<"$TOUCH_JSON"
)

if [[ "$RUNNING" != "true" ]]; then
  exit 1
fi

jq -r --arg outbound "$OUTBOUND" '
  .data.touch as $t
  | ($t.connectedServer // [])
  | map(select((.outbound // "proxy") == $outbound))
  | .[0] as $ref
  | if $ref == null then
      error("No connected server for outbound: " + $outbound)
    elif $ref._type == "subscriptionServer" then
      $t.subscriptions[$ref.sub].servers[$ref.id - 1].name
    else
      $t.servers[$ref.id - 1].name
    end
  | gsub("[\\x{1F1E6}-\\x{1F1FF}]"; "")
  | gsub("^\\s+|\\s+$"; "")
' <<<"$TOUCH_JSON"
