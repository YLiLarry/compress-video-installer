default:
	make git-update
	make compress-video
	make compress-video-ui
	make compress-video-update
	make copy-bin
	make run
	
.PHONY: git-update
.PHONY: compress-video	
.PHONY: compress-video-ui	
.PHONY: compress-video-update	
.PHONY: copy-bin
.PHONY: run

git-update:
	git submodule update --recursive --remote
	
run:
	./dist/app/ui/app --bin-dir ./dist/app/ --cfg-dir ./dist/config/

compress-video:
	cd ./compress-video && stack install

compress-video-ui:
	cd ./compress-video-ui && make
	rm -rf ./dist
	mkdir -p ./dist/config
	mkdir -p ./dist/app
	mv ./compress-video-ui/dist/app ./dist/app/ui
	cd ./compress-video-ui && make clean

compress-video-update:
	cd ./compress-video-update && stack install
	
copy-bin:
	cp `which compress-video-exe` ./dist/app/compress-video.exe
	cp `which compress-video-update-exe` ./dist/app/compress-video-update.exe
	
