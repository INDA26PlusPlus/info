TASKDIR	= assignments
TASKS	:= $(wildcard $(TASKDIR)/*)
SLIDES	:= $(wildcard $(TASKDIR)/*/slides.pdf)

README.md: header.md $(SLIDES)
	cp header.md $(@)
	for task in $(TASKS); do \
		name="$${task##*/}"; \
		line="* [$${name}]($${task})"; \
		[ -f "$${task}"/README.md ] || line="* $${name}"; \
		slides="$${task}"/slides.pdf; \
		[ -f "$${slides}" ] && line+=" ([slides]($${slides}))"; \
		>>$(@) echo "$${line}"; \
	done
