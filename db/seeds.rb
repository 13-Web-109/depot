# encoding: utf-8
#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
Product.delete_all
Product.create(title: 'CoffeeScript',
  description: 
    %{
        CoffeeScript is JavaScript done right. It provides all of JavaScript's
    functionality wrapped in a cleaner, more succinct syntax. In the first
    book on this exciting new language, CoffeeScript guru Trevor Burnham
    shows you how to hold onto all the power and flexibility of JavaScript
    while writing clearer, cleaner, and safer code.
      },
  image_url:   'cs.jpg',    
  price: 36.00,
  subcategory_id: 1)
# . . .
Product.create(title: 'Programming Ruby 1.9',
  description:
    %{
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      },
  image_url: 'ruby.jpg',
  price: 49.95,
  subcategory_id: 1)
# . . .

Product.create(title: 'Rails Test Prescriptions',
  description: 
    %{
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      },
  image_url: 'rtp.jpg',
  price: 34.95,
  subcategory_id: 1)

200.times do |n|
  Product.create(title: 'Test Book '+String(n),
    description: 
      %{
          <em>Test Book</em> is a comprehensive guide to testing
          Rails applications, covering Test-Driven Development from both a
          theoretical perspective (why to test) and from a practical perspective
          (how to test effectively). It covers the core Rails testing tools and
          procedures for Rails 2 and Rails 3, and introduces popular add-ons,
          including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
        },
    image_url: 'rtp.jpg',
    price: n+1.5,
    subcategory_id: n % 65 + 1)
end 

User.create(name: 'bluekey', password: '12345678', password_confirmation: '12345678', user_type: 0)


Category.create(name: '文学')
Subcategory.create(name: '杂文', category_id: 1)
Subcategory.create(name: '散文', category_id: 1)
Subcategory.create(name: '童话', category_id: 1)
Subcategory.create(name: '诗歌', category_id: 1)
Subcategory.create(name: '外国名著', category_id: 1)
Subcategory.create(name: '小说', category_id: 1)
Subcategory.create(name: '古代经典', category_id: 1)
Subcategory.create(name: '当代文学', category_id: 1)
Subcategory.create(name: '随笔', category_id: 1)
Subcategory.create(name: '随笔', category_id: 1)
Subcategory.create(name: '随笔', category_id: 1)

Category.create(name: '流行')
Subcategory.create(name: '漫画', category_id: 2)
Subcategory.create(name: '绘本', category_id: 2)
Subcategory.create(name: '推理', category_id: 2)
Subcategory.create(name: '青春', category_id: 2)
Subcategory.create(name: '言情', category_id: 2)
Subcategory.create(name: '科幻', category_id: 2)
Subcategory.create(name: '武侠', category_id: 2)
Subcategory.create(name: '悬疑', category_id: 2)
Subcategory.create(name: '奇幻', category_id: 2)
Subcategory.create(name: '轻小说', category_id: 2)
Subcategory.create(name: '魔幻', category_id: 2)

Category.create(name: '文化')
Subcategory.create(name: '历史', category_id: 3)
Subcategory.create(name: '哲学', category_id: 3)
Subcategory.create(name: '传记', category_id: 3)
Subcategory.create(name: '政治', category_id: 3)
Subcategory.create(name: '社会', category_id: 3)
Subcategory.create(name: '设计', category_id: 3)
Subcategory.create(name: '建筑', category_id: 3)
Subcategory.create(name: '宗教', category_id: 3)
Subcategory.create(name: '艺术', category_id: 3)
Subcategory.create(name: '国学', category_id: 3)
Subcategory.create(name: '戏剧', category_id: 3)
Subcategory.create(name: '军事', category_id: 3)
Subcategory.create(name: '思想', category_id: 3)


Category.create(name: '生活')
Subcategory.create(name: '爱情', category_id: 4)
Subcategory.create(name: '旅行', category_id: 4)
Subcategory.create(name: '励志', category_id: 4)
Subcategory.create(name: '摄影', category_id: 4)
Subcategory.create(name: '女性', category_id: 4)
Subcategory.create(name: '职场', category_id: 4)
Subcategory.create(name: '美食', category_id: 4)
Subcategory.create(name: '健康', category_id: 4)
Subcategory.create(name: '两性', category_id: 4)
Subcategory.create(name: '家居', category_id: 4)
Subcategory.create(name: '手工', category_id: 4)
Subcategory.create(name: '游记', category_id: 4)
Subcategory.create(name: '情感', category_id: 4)
Subcategory.create(name: '灵修', category_id: 4)

Category.create(name: '经管')
Subcategory.create(name: '经济学', category_id: 5)
Subcategory.create(name: '管理', category_id: 5)
Subcategory.create(name: '金融', category_id: 5)
Subcategory.create(name: '商业', category_id: 5)
Subcategory.create(name: '投资', category_id: 5)
Subcategory.create(name: '营销', category_id: 5)
Subcategory.create(name: '理财', category_id: 5)
Subcategory.create(name: '创业', category_id: 5)
Subcategory.create(name: '策划', category_id: 5)

Category.create(name: '科技')
Subcategory.create(name: '科普', category_id: 6)
Subcategory.create(name: '互联网', category_id: 6)
Subcategory.create(name: '软件', category_id: 6)
Subcategory.create(name: '交互设计', category_id: 6)
Subcategory.create(name: '用户体验', category_id: 6)
Subcategory.create(name: '算法', category_id: 6)
Subcategory.create(name: 'web', category_id: 6)
Subcategory.create(name: '科技', category_id: 6)
Subcategory.create(name: '通信', category_id: 6)
Subcategory.create(name: '刊物', category_id: 6)

