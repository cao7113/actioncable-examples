# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

cao = User.create! name: '曹操'
liu = User.create! name: '刘备'
sun = User.create! name: '孙权'
yuan = User.create! name: '袁绍'

Message.create! title: '魏', content: '先灭刘备还是先下江南', user: cao
Message.create! title: '蜀', content: '联吴抗曹', user: liu
