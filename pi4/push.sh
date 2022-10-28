# curl -v -H "Content-Type: application/json" -XPOST -s "http://localhost:3100/api/prom/push" --data-raw '{"streams": [{ "labels": "{job=\"logstash-images\"}", "entries": [{ "ts": "2022-10-25T08:27:06.801064-04:00", "line": "fizzbuzz" }] }]}'


# SRV="localhost:3100"
SRV="pi4a:32346"
while true 
do
  R=$(( $RANDOM % 9 + 1 ))
  D="$(date +%s)00000000$R"
  # D=1666960653000000007
  MSG='{"streams":[{"stream":{"job":"logstash-images","tenant_id":"1"},"values":[["'$D'","[GroupMetadataManager brokerId=1] Removed 0 expired offsets in 0 milliseconds. (kafka.coordinator.group.GroupMetadataManager)"]]}]}'
  echo $MSG
  curl -v -H "Content-Type: application/json" -XPOST -s "http://$SRV/loki/api/v1/push" --data-raw '{"streams":[{"stream":{"job":"logstash-images","tenant_id":"1"},"values":[["'$D'","[GroupMetadataManager brokerId=1] Removed 0 expired offsets in 0 milliseconds. (kafka.coordinator.group.GroupMetadataManager)"]]}]}'
  sleep 0.2
done