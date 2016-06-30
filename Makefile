bin := ./node_modules/.bin

build := build
entry_point := server.js

app_id := my-app-development

.PHONY: build
build:
	$(bin)/babel -d $(build) $(entry_point)
	$(bin)/babel -d $(build)/lib lib

clean:
	rm -rf $(build)/*

start:
	$(bin)/forever start --uid $(app_id) --append $(build)/$(entry_point)

stop:
	$(bin)/forever stop $(app_id)



########################
# Building blocks: Code
########################

check_style:
	$(bin)/eclint check *

