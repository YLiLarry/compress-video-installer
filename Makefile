default:
	make compress-video
	make compress-video-ui
	make compress-video-update
	mv ./compress-video-ui/dist ./dist

.PHONY: compress-video	
compress-video:
	cd ./compress-video && stack install

.PHONY: compress-video-ui	
compress-video-ui:
	cd ./compress-video-ui && make

.PHONY: compress-video-update	
compress-video-update:
	cd ./compress-video-update && stack install
	
