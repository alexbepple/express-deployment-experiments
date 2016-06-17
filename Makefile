bin := ./node_modules/.bin

build := build
entry_point := app.js

app_id := my-app-production

.PHONY: build
build:
	$(bin)/babel -d $(build) $(entry_point) 
	$(bin)/babel -d $(build)/lib lib

start:
	$(bin)/forever start --uid $(app_id) --append $(build)/$(entry_point)

stop:
	$(bin)/forever stop $(app_id)

