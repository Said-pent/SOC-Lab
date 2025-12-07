#!/bin/bash
# Script d'installation TheHive & Cortex - Said-pent

echo "[1/4] Préparation du dossier..."
cd ~/SOC-Lab/thehive-cortex

echo "[2/4] Correction des permissions Elasticsearch..."
# On force la création du volume et on donne les droits à l'utilisateur 1000
docker volume create thehive-cortex_elasticsearch_data
docker run --rm -v thehive-cortex_elasticsearch_data:/data alpine chown -R 1000:1000 /data

echo "[3/4] Lancement des conteneurs..."
docker compose up -d

echo "[4/4] Installation terminée !"
echo "Attendez environ 3 à 5 minutes (Démarrage de Cassandra)."
echo "-------------------------------------------------------"
echo "TheHive : http://$(hostname -I | cut -d' ' -f1):9000"
echo "Cortex  : http://$(hostname -I | cut -d' ' -f1):9001"
