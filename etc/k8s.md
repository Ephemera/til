Protocol error, got “H” as reply type byte
==========================================

k8s에 올린 redis가 위와 같은 응답을 내려주면 TCP 포트가 제대로 열리지 않은 것이다
ConfigMap이든 Service든 사용하는 것으로 확인 후 열어주면 해결
