# Run a http request against yopass service loadbalanced across all the replicas every 10 milliseconds
kubectl run -i --tty load-generator --rm --image=busybox \
 --restart=Never -- /bin/sh -c \
 "while sleep 0.01; do wget -q -O- http://yopass.default.svc.cluster.local:1337; done"