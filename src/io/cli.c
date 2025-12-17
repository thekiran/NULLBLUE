#include "io/cli.h"
#include "core/context.h"
#include "core/engine.h"
#include "io/logger.h"
#include <stdio.h>
#include <string.h>

static void usage(const char *exe) {
    fprintf(stderr,
        "Kullanim:\n"
        "  %s --config configs/default.json\n"
        "  %s --config configs/lab_profile.json\n"
        "Opsiyonel:\n"
        "  --dry-run=0|1\n"
        "  --lab-mode=0|1\n",
        exe, exe);
}

int cli_run(int argc, char **argv) {
    const char *config_path = "configs/default.json";

    nb_context_t ctx;
    context_init(&ctx);

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--config") == 0 && i + 1 < argc) {
            config_path = argv[++i];
        } else if (strncmp(argv[i], "--dry-run=", 10) == 0) {
            ctx.cfg.dry_run = (argv[i][10] == '1');
        } else if (strncmp(argv[i], "--lab-mode=", 11) == 0) {
            ctx.cfg.lab_mode = (argv[i][11] == '1');
        } else if (strcmp(argv[i], "--help") == 0) {
            usage(argv[0]);
            return 0;
        } else {
            fprintf(stderr, "Bilinmeyen arg: %s\n", argv[i]);
            usage(argv[0]);
            return 2;
        }
    }

    // Config yükle (varsayılanlar + override)
    context_load_config(&ctx, config_path);

    // Logger config’e göre aç
    if (!logger_init(ctx.cfg.log_path, LOG_INFO)) {
        fprintf(stderr, "Logger acilamadi: %s\n", ctx.cfg.log_path);
        return 3;
    }

    log_info("NULLBLUE baslatiliyor. config=%s", config_path);
    int rc = engine_run(&ctx);
    log_info("NULLBLUE kapandi. rc=%d", rc);

    logger_close();
    return rc;
}
