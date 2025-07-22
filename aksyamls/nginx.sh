helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm upgrade --install nginx-ingress ingress-nginx/ingress-nginx \
              --namespace $(NAMESPACE_NAME) \
              --set controller.service.externalTrafficPolicy=Local \
              --set controller.metrics.enabled=true \
              --set controller.podAnnotations."prometheus\.io/scrape"="true" \
              --set controller.podAnnotations."prometheus\.io/port"="10254"
