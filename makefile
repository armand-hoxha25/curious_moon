DB=enceladus
BUILD=${CURDIR}/build.sql
SCRIPTS=${CURDIR}
CSV='${CURDIR}/../data/master_plan.csv'
MASTER=$(SCRIPTS)/import.sql
NORMALIZE=$(SCRIPTS)/normalize.sql

all: normalize
	psql $(DB) -f $(BUILD)

master:
	@echo 'Current directy: ' ${CURDIR}
	@cat $(MASTER) >> $(BUILD)

import: master
	@echo "COPY import.master_plan FROM $(CSV) WITH DELIMITER ',' HEADER CSV;" >> $(BUILD)

normalize: import
	@cat $(NORMALIZE) >> $(BUILD)

clean: 
	@rm -rf $(BUILD)


