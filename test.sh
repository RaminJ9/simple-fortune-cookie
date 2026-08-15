#test file

#Find NodePort automatic
PORT=$(kubectl --kubeconfig kubeconfig get service frontend -o jsonpath='{.spec.ports[0].nodePort}')

curl --fail --silent http://localhost:$PORT > /dev/null

if [ $? -eq 0 ]; then
  echo "Application is running"
  exit 0
else
  echo "Application is not running"
  exit 1
fi