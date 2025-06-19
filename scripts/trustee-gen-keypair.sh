#!/bin/bash
set -euo pipefail

OUT_DIR="charts/all/trustee-operator/files"
mkdir -p "${OUT_DIR}"

# Generate keys
openssl genpkey -algorithm ed25519 -out "${OUT_DIR}/privateKey"
openssl pkey -in "${OUT_DIR}/privateKey" -pubout -out "${OUT_DIR}/publicKey"

base64 -w 0 ${OUT_DIR}/publicKey > ${OUT_DIR}/publicKey.b64

echo "✅ Keys written to ${OUT_DIR}:"
echo "   - privateKey"
echo "   - publicKey"
echo "   - publicKey.b64"
