#
# This file is part of IssueTracker.
#
# IssueTracker is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# IssueTracker is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with IssueTracker.  If not, see <http://www.gnu.org/licenses/>.
#

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

    p1 = Project.create! name: '忘年会', deadline: '2018-12-25', goal: <<TEXT
忘年会を開催してみんなで楽しむ。
TEXT
    p2 = Project.create! name: '働き方改革', deadline: '2018-12-25', goal: <<TEXT
やりがいのある仕事の仕方をする。
TEXT

    p1.issues.create! title: '場所の予約', user: u1, deadline: '2018-01-15', content: <<TEXT
場所を予約する。
人数をちゃんと伝える。
TEXT
    p1.issues.create! title: '人数の確認', user: u2, deadline: '2018-12-14', content: <<TEXT
みんなに参加希望を募って最終的な参加者を確定する。
TEXT

    p2.issues.create! title: '提案を集める', user: u3, deadline: '2018-12-18', content: <<TEXT
みんなからアイディアを集める。
TEXT

    p2.issues.create! title: '労働法の確認', user: u1, deadline: '2018-12-20', content: <<TEXT
労働法の変更点を確認しておく。
TEXT

  end
end
