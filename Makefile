# run: make run
dosbox = "/Applications/dosbox-x.app/Contents/MacOS/dosbox-x"

deps:
	brew cask install dosbox-x

hdd.img:
	$(dosbox) --conf win98.conf -c "IMGMAKE hdd.img -t hd_8gig" -c "EXIT"

run: hdd.img
	# Run with dynamic core
	$(dosbox) --conf win98dynamic.conf \
		-c "KEYB de" \
		-c "IMGMOUNT C hdd.img " \
		-c "IMGMOUNT D win98.iso" \
		-c "MOUNT G sw" \
		-c "IMGMOUNT E sw/1.cue sw/2.cue -t iso -fs iso" \
		-c "BOOT C:"

setup: hdd.img
	# Install with normal core
	$(dosbox) --conf win98normal.conf \
		-c "KEYB de" \
		-c "IMGMOUNT C hdd.img " \
		-c "IMGMOUNT D win98.iso" \
		-c "D:\SETUP.EXE"
