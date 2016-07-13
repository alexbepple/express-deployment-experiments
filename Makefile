bin := ./node_modules/.bin

build := build

entry_point := server.js
main_code := lib


#########
# Deploy
#########

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


##########
# Develop
##########

dev:
	$(bin)/nodemon \
		--delay 200ms --watch $(entry_point) --watch $(main_code) --ignore '*test.js' \
		--exec $(bin)/babel-node $(entry_point)

tdd:
	$(bin)/supervisor --no-restart-on exit -x make test


#######
# Code
#######

check_style:
	$(bin)/eclint check *
	$(bin)/standard

.PHONY: test
test:
	$(bin)/mocha '**/__tests__/**/*.js' --check-leaks --compilers js:babel-register --reporter mocha-unfunk-reporter $(args)

