package main

import (
	"fmt"
	"gomall/demo/demo_proto/biz/dal"
	"gomall/demo/demo_proto/biz/dal/mysql"
	"gomall/demo/demo_proto/model"

	"github.com/joho/godotenv"
)

func main() {
	err := godotenv.Load()
	if err != nil {
		panic(err)
	}
	dal.Init()
	mysql.DB.Create(&model.User{
		Email:    "demo@example.com",
		Password: "demo",
	})

	mysql.DB.Model(&model.User{}).Where("email = ?", "demo@example.com").Update("password", "demo123")

	var row model.User
	mysql.DB.Model(&model.User{}).Where("email = ?", "demo@example.com").First(&row)

	fmt.Printf("\nrow: %+v\n", row)

	mysql.DB.Unscoped().Model(&model.User{}).Where("email = ?", "demo@example.com").Delete(&model.User{})

}
