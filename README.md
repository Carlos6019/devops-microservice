# DevOps Technical Assessment

## Descripción

Este proyecto es un microservicio desarrollado en Node.js + Express, containerizado y desplegado en AWS EKS, cumpliendo con los requisitos del reto técnico.

---

## Requisitos y Tecnologías

- Node.js, Express, JWT
- Docker, Kubernetes (EKS)
- Terraform (IaC)
- GitHub Actions (CI/CD)
- AWS (EKS, ECR, S3, CloudFront)
- Linting, Testing (Jest)
- CloudFront configurado para reenviar headers personalizados

---

## Cómo correr localmente

```bash
# Instalar dependencias
cd microservice
npm install

# Ejecutar en desarrollo
npm run dev

# Probar endpoint
curl -X POST \
  -H "X-Parse-REST-API-Key: 2f5ae96c-b558-4c7b-a590-a501ae1c3f6c" \
  -H "X-JWT-KWY: cualquier-valor-unico" \
  -H "Content-Type: application/json" \
  -d '{ "message" : "This is a test", "to": "Juan Perez", "from": "Rita Asturia", "timeToLifeSec" : 45 }' \
  http://localhost:3000/DevOps
```
---

## Cómo correr con Docker

```bash
docker build -t devops-microservice ./microservice
docker run -p 3000:3000 devops-microservice
```

---

## Despliegue en Kubernetes

```bash
kubectl apply -f k8s/microservice/namespace.yaml
kubectl apply -f k8s/microservice/deployment.yaml
kubectl apply -f k8s/microservice/service.yaml
```

---

## Pipeline CI/CD

- El pipeline está en `.github/workflows/pipeline_cicd.yaml`
- Ejecuta: Terraform plan/apply, build/test/lint Docker, despliegue a EKS
- Deploy automático en master

---

## Validación de API Key y JWT

- El endpoint `/DevOps` requiere el header `X-Parse-REST-API-Key` con el valor `2f5ae96c-b558-4c7b-a590-a501ae1c3f6c`
- El JWT se genera y retorna en el header `X-JWT-KWY`
- Otros métodos HTTP devuelven `"ERROR"`

---

## Pruebas

```bash
npm test
npm run lint
```

---

## Endpoint público

- [https://tudominio.cloudfront.net/DevOps] > se envio por correo electronico. 

## Prueba rápida del microservicio

### 1. Endpoint principal

**URL:**  
`https://<tu-endpoint-cloudfront>/DevOps`

### 2. Headers obligatorios

- `X-Parse-REST-API-Key: 2f5ae96c-b558-4c7b-a590-a501ae1c3f6c`
- `Content-Type: application/json`

### 3. Ejemplo de petición válida

```bash
curl -X POST "https://<tu-endpoint-cloudfront>/DevOps" \
  -H "X-Parse-REST-API-Key: 2f5ae96c-b558-4c7b-a590-a501ae1c3f6c" \
  -H "Content-Type: application/json" \
  -d '{ "message": "This is a test", "to": "Juan Perez", "from": "Rita Asturia", "timeToLifeSec": 45 }' -i
```

**El header de respuesta `X-JWT-KWY` contendrá el JWT generado.**

---

### 5. Ejemplo de error (método no permitido)

```bash
curl -X GET "https://<tu-endpoint-cloudfront>/DevOps"
```
**Respuesta:**  
`"ERROR"`

---

### 6. Notas

- El endpoint solo acepta POST.
- El header `X-Parse-REST-API-Key` es obligatorio.
- El JWT retornado en el header `X-JWT-KWY` puede ser usado en futuras peticiones si se requiere validación.
- CloudFront está configurado para reenviar los headers personalizados.
