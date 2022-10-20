# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者アカウント作成
Admin.create!(
    email: 'admin@admin',
    password: 'adminadmin',
)
#Playerの登録（ほかのテーブルは登録しません。）
#日本代表召集選手(KIRIN 2022/09/27)
Player.create!(
    [
        {name: '川島永嗣',birthday: '19830320	',height: '185',weight: '82'},
        {name: '山根視来',birthday: '19931222',height: '178',weight: '72'},
        {name: '谷口彰悟',birthday: '19910715',height: '183',weight: '75'},
        {name: '瀬古歩夢',birthday: '20000607',height: '185',weight: '80'},
        {name: '長友佑都',birthday: '19860912',height: '170',weight: '68'},
        {name: '遠藤航',birthday: '19930209',height: '178',weight: '76'},
        {name: '柴崎岳',birthday: '19920528	',height: '175',weight: '64'},
        {name: '原口元気',birthday: '19910509',height: '177',weight: '68'},
        {name: '古橋亨梧',birthday: '19950120',height: '170',weight: '63'},
        {name: '南野拓実',birthday: '19950116',height: '174',weight: '68'},
        {name: '久保建英',birthday: '20010604',height: '173',weight: '67'},
        {name: '権田修一',birthday: '19890303',height: '187',weight: '84'},
        {name: '守田英正',birthday: '19950510',height: '177',weight: '74'},
        {name: '伊東純也',birthday: '19930309',height: '176',weight: '66'},
        {name: '鎌田大地',birthday: '19960805',height: '180',weight: '72'},
        {name: '冨安健洋',birthday: '19981105',height: '187',weight: '84'},
        {name: '田中碧',birthday: '19980910',height: '180',weight: '75'},
        {name: '三笘薫',birthday: '19970520',height: '178',weight: '73'},
        {name: '酒井宏樹',birthday: '19900412',height: '185',weight: '78'},
        {name: '中山雄太',birthday: '19970216',height: '181',weight: '76'},
        {name: '堂安律',birthday: '19980616',height: '172',weight: '70'},
        {name: '吉田麻也',birthday: '19880824',height: '189',weight: '87'},
        {name: 'シュミット・ダニエル',birthday: '19920203',height: '197',weight: '88'},
        {name: '旗手怜央',birthday: '19971121',height: '171',weight: '70'},
        {name: '前田大然',birthday: '19971020',height: '173',weight: '67'},
        {name: '上田綺世',birthday: '19980828',height: '182',weight: '76'},
        {name: '相馬勇紀',birthday: '19970225',height: '166',weight: '68'},
        {name: '伊藤洋輝',birthday: '19990512',height: '186',weight: '78'},
        {name: '町野修斗',birthday: '19990930',height: '185',weight: '77'},
        {name: '谷晃生',birthday: '20001122',height: '190',weight: '87'}
    ]
)
#スペイン代表召集選手(UNL 2022/09/28)
Player.create!(
    [
        {name: 'ロベルト・サンチェス',birthday: '19971118',height: '197',weight: '90'},
        {name: 'ニコ・ウィリアムズ',birthday: '20020712',height: '181',weight: ''},
        {name: 'ボルハ・イグレシアス',birthday: '19930117',height: '187',weight: '87'},
        {name: 'パウ・トーレス',birthday: '19970116',height: '192',weight: '80'},
        {name: 'セルヒオ・ブスケツ',birthday: '19880716',height: '189',weight: '68'},
        {name: 'マルコス・ジョレンテ',birthday: '19950130',height: '183',weight: '85'},
        {name: 'アルバロ・モラタ',birthday: '19921023',height: '189',weight: '85'},
        {name: 'コケ',birthday: '19920108',height: '176',weight: '73'},
        {name: 'ガビ',birthday: '20040805',height: '173',weight: '70'},
        {name: 'マルコ・アセンシオ',birthday: '19960121',height: '182',weight: '75'},
        {name: 'フェラン・トーレス',birthday: '20000229',height: '184',weight: '77'},
        {name: 'ウーゴ・ギジャモン',birthday: '20000131',height: '182',weight: '62'},
        {name: 'ダビド・ラジャ',birthday: '19950915',height: '183',weight: '80'},
        {name: 'ホセ・ルイス・ガヤ',birthday: '19950525',height: '172',weight: '64'},
        {name: 'ジェレミ・ピノ',birthday: '20021020',height: '172',weight: '65'},
        {name: 'ロドリゴ・エルナンデス',birthday: '19960622',height: '191',weight: ''},
        {name: 'ディエゴ・ジョレンテ',birthday: '19930816',height: '186',weight: '75'},
        {name: 'ジョルディ・アルバ',birthday: '19890321',height: '170',weight: '68'},
        {name: 'カルロス・ソレール',birthday: '19970102',height: '183',weight: '72'},
        {name: 'ダニエル・カルバハル',birthday: '19920111',height: '173',weight: '73'},
        {name: 'ペドリ',birthday: '20021125',height: '174',weight: '61'},
        {name: 'パブロ・サラビア',birthday: '19920511',height: '176',weight: '72'},
        {name: 'ウナイ・シモン',birthday: '19970611',height: '190',weight: '86'}
    ]
)
#ドイツ代表召集選手(UNL 2022/09/24)
Player.create!(
    [
        {name: 'オリヴァー・バウマン',birthday: '19900602',height: '187',weight: '80'},
        {name: 'アントニオ・リュディガー',birthday: '19930303',height: '190',weight: '85'},
        {name: 'ダヴィド・ラウム',birthday: '19980422',height: '180',weight: ''},
        {name: 'マティアス・ギンター',birthday: '19940119',height: '191',weight: '87'},
        {name: 'ティロ・ケーラー',birthday: '19960921',height: '185',weight: ''},
        {name: 'ヨシュア・キミッヒ',birthday: '19950208',height: '177',weight: '75'},
        {name: 'カイ・ハフェルツ',birthday: '19990611',height: '190',weight: '82'},
        {name: 'マクシミリアン・アルノルト',birthday: '19940527',height: '183',weight: '74'},
        {name: 'ティモ・ヴェルナー',birthday: '19960306',height: '180',weight: '75'},
        {name: 'セルジュ・ニャブリ',birthday: '19950714',height: '176',weight: '77'},
        {name: 'ルーカス・ヌメチャ',birthday: '19981214',height: '183',weight: ''},
        {name: 'ケヴィン・トラップ',birthday: '19900708',height: '189',weight: '83'},
        {name: 'トーマス・ミュラー',birthday: '19890913',height: '186',weight: '76'},
        {name: 'ジャマル・ムシアラ',birthday: '20030226',height: '184',weight: '72'},
        {name: 'ニクラス・ズーレ',birthday: '19950903',height: '195',weight: '89'},
        {name: 'ベンヤミン・ヘンリヒス',birthday: '19970223',height: '185',weight: '79'},
        {name: 'アーメル・ベラ=コチャプ',birthday: '20011211',height: '190',weight: ''},
        {name: 'ヨナス・ホフマン',birthday: '19920714',height: '176',weight: '67'},
        {name: 'レロイ・サネ',birthday: '19960111',height: '183',weight: '80'},
        {name: 'ロビン・ゴセンス',birthday: '19940605',height: '183',weight: '76'},
        {name: 'イルカイ・ギュンドアン',birthday: '19901024',height: '180',weight: '80'},
        {name: 'テア・シュテーゲン',birthday: '19920430',height: '187',weight: '85'},
        {name: 'ニコ・シュロッターベック',birthday: '19991201',height: '191',weight: '85'}
    ]
)