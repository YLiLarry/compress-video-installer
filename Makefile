default:
	make compress-video
	make compress-video-ui
	make compress-video-update
	make copy-bin

.PHONY: compress-video	
compress-video:
	cd ./compress-video && stack install

.PHONY: compress-video-ui	
compress-video-ui:
	cd ./compress-video-ui && make
	rm -rf ./dist
	mkdir -p ./dist/config
	mkdir -p ./dist/app
	mv ./compress-video-ui/dist/app ./dist/app/ui
	cd ./compress-video-ui && make clean

.PHONY: compress-video-update	
compress-video-update:
	cd ./compress-video-update && stack install
	
.PHONY: copy-bin
copy-bin:
	cp `which compress-video-exe` ./dist/app/compress-video.exe
	cp `which compress-video-update-exe` ./dist/app/compress-video-update.exe
	