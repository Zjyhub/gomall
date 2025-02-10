.PHONY: gen-demo-proto
gen-demo-proto:
	@cd demo/demo_proto && cwgo server -I ../../idl --type RPC --module gomall/demo/demo_proto --service demo_proto --idl ../../idl/echo.proto 

# .PHONY: gen-frontend:
# gen-frontend:
# 	cwgo server --type HTTP --idl ../../idl/frontend/home.proto --service frontend --module gomall/app/frontend -I ../../idl/

.PHONY: gen-frontend
gen-frontend: ## 生成 {svc} 服务的网关代码。例如：make gen-frontend svc=product_http
	@cd app/frontend && cwgo server -I ../../idl --type HTTP --service frontend --module gomall/app/frontend --idl ../../idl/frontend/${svc}.proto

.PHONY: gen-client
gen-client: ## 生成 {svc} 服务的客户端代码。例如：make gen-client svc=product
	@cd rpc_gen && cwgo client --type RPC --service ${svc} --module gomall/rpc_gen -I ../idl --idl ../idl/${svc}.proto

.PHONY: gen-server
gen-server: ## 生成 {svc} 服务的服务端代码。例如：make gen-server svc=product
	@cd app/${svc} && cwgo server --type RPC --service ${svc} --module gomall/app/${svc} --pass "-use gomall/rpc_gen/kitex_gen" -I ../../idl --idl ../../idl/${svc}.proto
