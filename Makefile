# KB stands for keyboard
# KM stands for keymap
KB:=keychron/q8/ansi
KM:=turboMaCk

# Env override
QMKCONFIG:=.home/.config/qmk/qmk.ini

# Command flags
RM:=rm -rf
CP:=cp -R
QMK:=qmk --config-file $(QMKCONFIG)

.PHONY: init
init:
	$(RM) qmk_firmware/keyboards/$(KB)
	$(CP) keyboards/$(KB) qmk_firmware/keyboards/$(KB)

.PHONY: compile
compile: init
	$(QMK) compile -kb $(KB) -km $(KM)

.PHONY: flash
flash: init
	$(QMK) flash -kb $(KB) -km $(KM)

.PHONY: clean
clean:
	git --git-dir=qmk_firmware/.git reset --hard

.PHONY: update
update: clean
	git submodule init
	git submodule update --recursive
