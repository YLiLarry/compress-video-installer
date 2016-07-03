default:
	make compress-video
	make compress-video-ui
	make compress-video-update

.PHONY: compress-video	
compress-video:
	cd ./compress-video && stack install

.PHONY: compress-video-ui	
compress-video-ui:
	cd ./compress-video-ui && make && rm -rf ../dist && mv ./dist ../dist && make clean

.PHONY: compress-video-update	
compress-video-update:
	cd ./compress-video-update && stack install
	