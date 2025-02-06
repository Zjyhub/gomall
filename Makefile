.PHONY: gen-demo-proto
gen-demo-proto:
	@cd demo/demo_proto && cwgo server -I ../../idl --type RPC --module gomall/demo/demo_proto --service demo_proto --idl ../../idl/echo.proto 