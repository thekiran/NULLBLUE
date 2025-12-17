#!/usr/bin/env bash
set -euo pipefail

# Bu scripti ~/NULLBLUE içindeyken çalıştır.
# Güvenlik: yanlış dizinde çalıştırmayı engellemek için kontrol edelim.
if [[ "$(basename "$PWD")" != "NULLBLUE" ]]; then
  echo "HATA: NULLBLUE dizininde değilsin. Şu an: $PWD"
  echo "Önce: cd ~/NULLBLUE"
  exit 1
fi

# 1) Klasörler
mkdir -p \
  compliance \
  engagements/approvals \
  research/known_issues \
  research/protocol_notes \
  experiments/datasets \
  experiments/results \
  evidence/logs \
  evidence/pcap \
  evidence/screenshots \
  evidence/timelines \
  reporting/findings \
  reporting/remediation \
  configs \
  include/core \
  include/io \
  include/platform \
  include/safety \
  include/util \
  src/core \
  src/io \
  src/platform \
  src/safety \
  src/util \
  tests/unit \
  tests/fixtures \
  tools/scripts \
  tools/schemas \
  build \
  out

# 2) Kök dosyalar
touch README.md LICENSE .gitignore Makefile CMakeLists.txt

# 3) compliance
touch \
  compliance/legal.md \
  compliance/privacy.md \
  compliance/retention.md

# 4) engagements
touch \
  engagements/lab_scope.md \
  engagements/rules_of_engagement.md \
  engagements/safety_controls.md \
  engagements/approvals/authorization_letter.pdf \
  engagements/approvals/risk_acceptance.md

# 5) research
touch \
  research/hypotheses.md \
  research/known_issues/README.md \
  research/protocol_notes/README.md

# 6) experiments
touch \
  experiments/scenarios.md \
  experiments/metrics.md \
  experiments/datasets/README.md \
  experiments/results/README.md

# 7) evidence
touch \
  evidence/logs/README.md \
  evidence/pcap/README.md \
  evidence/screenshots/README.md \
  evidence/timelines/README.md

# 8) reporting
touch \
  reporting/executive_summary.md \
  reporting/technical_report.md \
  reporting/findings/finding_template.md \
  reporting/findings/risk_matrix.md \
  reporting/remediation/hardening_guide.md \
  reporting/remediation/verification_plan.md

# 9) configs
touch \
  configs/default.json \
  configs/lab_profile.json

# 10) include (header'lar)
touch \
  include/core/context.h \
  include/core/engine.h \
  include/core/scheduler.h \
  include/core/version.h \
  include/io/cli.h \
  include/io/exporter.h \
  include/io/logger.h \
  include/platform/platform.h \
  include/platform/time.h \
  include/safety/checks.h \
  include/safety/guards.h \
  include/util/fs.h \
  include/util/json.h \
  include/util/str.h

# 11) src (C dosyaları)
touch \
  src/main.c \
  src/core/context.c \
  src/core/engine.c \
  src/core/scheduler.c \
  src/core/version.c \
  src/io/cli.c \
  src/io/exporter.c \
  src/io/logger.c \
  src/platform/platform.c \
  src/platform/time.c \
  src/safety/checks.c \
  src/safety/guards.c \
  src/util/fs.c \
  src/util/json.c \
  src/util/str.c

# 12) tests
touch \
  tests/README.md \
  tests/unit/test_cli.c \
  tests/unit/test_config.c \
  tests/unit/test_guards.c \
  tests/unit/test_scheduler.c \
  tests/fixtures/sample_default.json \
  tests/fixtures/sample_lab_profile.json

# 13) tools
touch \
  tools/README.md \
  tools/scripts/run_lab.sh \
  tools/scripts/collect_evidence.sh \
  tools/scripts/pack_report.sh \
  tools/schemas/config.schema.json \
  tools/schemas/log.schema.json

# 14) build/out gitkeep
touch build/.gitkeep out/.gitkeep

# Script dosyalarına çalıştırma izni
chmod +x tools/scripts/*.sh

echo "OK: NULLBLUE ağaç yapısı oluşturuldu."
