bin := ./node_modules/.bin

build := build

entry_point := server.js
main_code := lib

app_id := my-app-development

.PHONY: build
build:
	$(bin)/babel -d $(build) $(entry_point)
	$(bin)/babel -d $(build)/$(main_code) $(main_code)

clean:
	rm -rf $(build)/*

start:
	$(bin)/forever start --uid $(app_id) --append $(build)/$(entry_point)

stop:
	$(bin)/forever stop $(app_id)


run_server_restarting_on_changes:
	$(bin)/nodemon -x $(bin)/babel-node -w $(entry_point) -w $(main_code) $(entry_point)


########################
# Building blocks: Code
########################

check_style:
	$(bin)/eclint check *
	$(bin)/standard

