namespace :sample do

  task build: :environment do

    u1 = User.create! username: 'yamada', name: '山田 太郎',
                      email: 'yamada@example.com',
                      password: 'test', password_confirmation: 'test'

    u2 = User.create! username: 'suzuki', name: '鈴木 次郎',
                      email: 'suzuki@example.com',
                      password: 'test', password_confirmation: 'test'

    u3 = User.create! username: 'sato', name: '佐藤 花子',
                      email: 'sato@example.com',
                      password: 'test', password_confirmation: 'test'

    u4 = User.create! username: 'takahashi', name: '高橋 優子',
                      email: 'takahashi@example.com',
                      password: 'test', password_confirmation: 'test'

    p1 = Project.create! name: '忘年会', deadline: '2018-12-25', goal: <<TEXT
忘年会を開催してみんなで楽しむ。
TEXT
    p2 = Project.create! name: '働き方改革', deadline: '2018-12-25', goal: <<TEXT
やりがいのある仕事の仕方をする。
TEXT


    p1.issues.create! title: '場所の予約', user: u1, deadline: '2018-12-15', content: <<TEXT
場所を予約する。
人数をちゃんと伝える。
TEXT
    p1.issues.create! title: '人数の確認', user: u2, deadline: '2018-12-14', content: <<TEXT
みんなに参加希望を募って最終的な参加者を確定する。
TEXT

  end


end