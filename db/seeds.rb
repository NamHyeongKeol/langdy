# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 형걸이용 유저목록
#
user = User.create!([{id: 1, email: "grey_pastor@naver.com", password: "12341234", password_confirmation: "12341234", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-04-11 10:19:33", last_sign_in_at: "2016-04-11 10:19:33", current_sign_in_ip: "::1", last_sign_in_ip: "::1", created_at: "2016-04-11 10:19:33", updated_at: "2016-04-11 10:19:33", name: "로컬용", skype_id: "grey_pastor", lang_to_learn: "Chinese", native_lang: "Korean", is_teacher: true, is_admin: true, cash: 0, profile_pic: "___________________.jpg", gender: "Male", lang_to_learn_1: "Chinese", lang_to_learn_2: "Chinese", lang_to_teach_1: "Korean", lang_to_teach_2: "Korean"}])
user = User.create!([{id: 2, email: "asdfasdf@naver.com", password: "12341234", password_confirmation: "12341234", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-04-11 11:03:24", last_sign_in_at: "2016-04-11 11:03:24", current_sign_in_ip: "::1", last_sign_in_ip: "::1", created_at: "2016-04-11 11:03:24", updated_at: "2016-04-11 11:03:24", name: "asdfasdf", skype_id: "asdfasdf", lang_to_learn: "Korean", native_lang: "Chinese", is_teacher: true, is_admin: true, cash: 0, profile_pic: nil, gender: "Male", lang_to_learn_1: "Korean", lang_to_learn_2: "English", lang_to_teach_1: "Chinese", lang_to_teach_2: "Chinese"}])
user = User.create!([{id: 3, email: "asdf@naver.com", password: "12341234", password_confirmation: "12341234", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-04-11 11:03:24", last_sign_in_at: "2016-04-11 11:03:24", current_sign_in_ip: "::1", last_sign_in_ip: "::1", created_at: "2016-04-11 11:03:24", updated_at: "2016-04-11 11:03:24", name: "asdf", skype_id: "asdf", lang_to_learn: "Korean", native_lang: "English", is_teacher: true, is_admin: true, cash: 0, profile_pic: nil, gender: "Female", lang_to_learn_1: "Korean", lang_to_learn_2: "Korean", lang_to_teach_1: "English", lang_to_teach_2: "English"}])
user = User.create!([{id: 4, email: "asdfasdfasdf@naver.com", password: "12341234", password_confirmation: "12341234", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-04-11 11:03:24", last_sign_in_at: "2016-04-11 11:03:24", current_sign_in_ip: "::1", last_sign_in_ip: "::1", created_at: "2016-04-11 11:03:24", updated_at: "2016-04-11 11:03:24", name: "asdfasdfasdf", skype_id: "asdfasdfasdf", lang_to_learn: "English", native_lang: "Korean", is_teacher: true, is_admin: true, cash: 0, profile_pic: nil, gender: "Female", lang_to_learn_1: "English", lang_to_learn_2: "Chinese", lang_to_teach_1: "Korean", lang_to_teach_2: "Korean"}])
user = User.create!([{id: 5, email: "qwer@naver.com", password: "12341234", password_confirmation: "12341234", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-04-11 11:03:24", last_sign_in_at: "2016-04-11 11:03:24", current_sign_in_ip: "::1", last_sign_in_ip: "::1", created_at: "2016-04-11 11:03:24", updated_at: "2016-04-11 11:03:24", name: "qwer", skype_id: "qwer", lang_to_learn: "Chinese", native_lang: "Korean", is_teacher: true, is_admin: true, cash: 0, profile_pic: nil, gender: "Female", lang_to_learn_1: "Chinese", lang_to_learn_2: "Chinese", lang_to_teach_1: "Korean", lang_to_teach_2: "Korean"}])
user = User.create!([{id: 6, email: "qwerqwer@naver.com", password: "12341234", password_confirmation: "12341234", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2016-04-11 11:03:24", last_sign_in_at: "2016-04-11 11:03:24", current_sign_in_ip: "::1", last_sign_in_ip: "::1", created_at: "2016-04-11 11:03:24", updated_at: "2016-04-11 11:03:24", name: "qwerqwer", skype_id: "qwerqwer", lang_to_learn: "English", native_lang: "Korean", is_teacher: true, is_admin: true, cash: 0, profile_pic: nil, gender: "Male", lang_to_learn_1: "English", lang_to_learn_2: "Chinese", lang_to_teach_1: "Korean", lang_to_teach_2: "Korean"}])

# 형걸이용 선생목록
t = TeacherInfo.create!([{user_id: 1, major: "cs", school_grad: "snu", introduction: "로컬용", location: "seoul", is_approved: true, created_at: "2016-04-11 10:19:33", updated_at: "2016-04-11 11:01:31", gender: "Male", lecture_price: 1, lecture_number: 5, rating: 5, student_number: 5, skype_id: "grey_pastor"}])
t = TeacherInfo.create!([{user_id: 2, major: "cs", school_grad: "snu", introduction: "asdfasdf", location: "seoul", is_approved: true, created_at: "2016-04-11 10:19:33", updated_at: "2016-04-11 11:01:31", gender: "Male", lecture_price: 1, lecture_number: 6, rating: 5, student_number: 20, skype_id: "asdfasdf"}])
t = TeacherInfo.create!([{user_id: 3, major: "cs", school_grad: "snu", introduction: "asdf", location: "seoul", is_approved: true, created_at: "2016-04-11 10:19:33", updated_at: "2016-04-11 11:01:31", gender: "Female", lecture_price: 1, lecture_number: 7, rating: 5, student_number: 40, skype_id: "asdf"}])
t = TeacherInfo.create!([{user_id: 4, major: "cs", school_grad: "snu", introduction: "asdfasdfasdf", location: "seoul", is_approved: true, created_at: "2016-04-11 10:19:33", updated_at: "2016-04-11 11:01:31", gender: "Female", lecture_price: 1, lecture_number: 8, rating: 5, student_number: 30, skype_id: "asdfasdfasdf"}])
t = TeacherInfo.create!([{user_id: 5, major: "cs", school_grad: "snu", introduction: "qwer", location: "seoul", is_approved: true, created_at: "2016-04-11 10:19:33", updated_at: "2016-04-11 11:01:31", gender: "Female", lecture_price: 1, lecture_number: 9, rating: 5, student_number: 10, skype_id: "qwer"}])
t = TeacherInfo.create!([{user_id: 6, major: "cs", school_grad: "snu", introduction: "qwerqwer", location: "seoul", is_approved: true, created_at: "2016-04-11 10:19:33", updated_at: "2016-04-11 11:01:31", gender: "Male", lecture_price: 1, lecture_number: 10, rating: 5, student_number: 50, skype_id: "qwerqwer"}])

# 형걸이용 코인내역
CoinHistory.create!([{id: 1, user_id: 1, is_buycoin: true, buycoin_complete: false, is_exchange: false, exchange_comlete: false, amount: 5, time: "2016-04-23 18:57:00", created_at: "2016-04-23 09:58:16", updated_at: "2016-04-23 09:58:16"}])
CoinHistory.create!([{ id: 2, user_id: 1, is_buycoin: true, buycoin_complete: false, is_exchange: false, exchange_comlete: false, amount: 5, time: "2016-04-23 10:02:53", created_at: "2016-04-23 09:58:51", updated_at: "2016-04-23 10:02:53"}])
CoinHistory.create!([{ id: 3, user_id: 3, is_buycoin: true, buycoin_complete: false, is_exchange: false, exchange_comlete: false, amount: 5, time: "2016-04-23 10:02:57", created_at: "2016-04-23 09:59:54", updated_at: "2016-04-23 10:03:06"}])
CoinHistory.create!([{ id: 4, user_id: 4, is_buycoin: true, buycoin_complete: true, is_exchange: false, exchange_comlete: false, amount: 5, time: "2016-04-23 10:01:03", created_at: "2016-04-23 10:01:03", updated_at: "2016-04-23 10:03:19"}])

course = Course.create!([{lang: 'Korean', rank: '고급', subject: 'Ch74. 출퇴근 시간 자율 제도, 친환경 마크', content: '
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="style.css">
    <title></title>
</head>
<body>

<p class="curri-title">Ch74. 출퇴근 시간 자율 제도, 친환경 마크</p>

<p class="curri-text1">1. 어휘 : 함께 읽으면서 어휘를 배워보세요.</p><div class="curri-text2">

<p>1.1. 출퇴근 자율 제도：自由上下班制度</p>

<p>1.2. 정하다：定下/确定</p>

<p>1.3. 업무：业务/工作</p>

<p>1.4. 효율성：效率性</p>

<p>1.5. 함께：一起</p>

<p>1.6. 만족도：满足</p>

<p>1.7. 매출：销售</p>

<p>1.8. 친환경：绿色/环保</p>

<p>1.9. 마크：商标/唛头</p>

<p>1.10. 농약：农药</p>

<p>1.11. 소비자：消费者</p>

<p>1.12. 반응：反映</p>

<p>1.13. 기준：标准</p>

<p>1.14. 적용하다：适用</p>

<p>1.15. 엄격하다：严格</p>

</div><p class="curri-text1">2. 예문 : 함께 읽으면서 발음, 의미, 표현을 연습해보세요. 선생님과 학생이 함께 읽거나, 역할을 바꾸면서 읽어보세요.</p>

<p class="curri-text2">2.1. 예문 1</p><div class="curri-text3">

<p>A : ‘출퇴근 시간 자율 제도’라는 거 들어 봤어요? 정해진 출퇴근 시간 없이 1일 업무 시간을 일하면 되는 건데요. 시간을 자유롭게 사용할 수 있어서 직원들이 좋아한대요.</p>

<p>B : 글쎄요. ‘출퇴근 시간 자율 제도’를 하면 자유롭기는 하겠지만 업무의 효율성은 낮아질 것 같아요. 같은 시간에 함께 모여서 해야 할 일들을 하는 게 어려워질 테니까요.</p>

<p>A : 그렇지만 이렇게 하는 회사들은 직원들의 만족도도 높고 매출도 높아졌다고 하더라고요.</p>

<p>B : 매출이 높아진 게 그 제도 때문일까요? 그리고 ‘출퇴근 시간 자율 제도’를 할지 말지는 회사의 업무 내용에 따라서 달라져야 한다고 생각해요. </p>

<p>2.1.1. 위 글의 주제를 설명해 보세요.</p>

<p>2.1.2. 이 주제에 대한 생각을 말해 보세요.</p>

</div><p class="curri-text2">2.2. 예문 2</p><div class="curri-text3">

<p>요즘 친환경 마크가 있는 야채들을 많이 보셨을 겁니다. 이 야채들은 농약을 사용하지 않은 것이라서 소비자들의 반응이 좋은데요. 하지만 최근 친환경 마크의 기준이 약하다는 의견이 많습니다. 얼마 전 발표한 연구 결과 때문인데, 친환경 마크가 적용된 야채들 중에서 기준에 맞지 않는 것들이 있다는 내용입니다. 소비자들의 건강을 위해서는 엄격한 기준을 적용해야 할 것입니다.</p>

<p>2.2.1. 위 글의 주제를 설명해 보세요.</p>

<p>2.2.2. 이 주제에 대한 생각을 말해 보세요.</p>

</div><p class="curri-text1">3. 복습 및 연습 : 오늘 배운 어휘를 참고해서 회화 연습을 해보세요.</p><div class="curri-text2">

<p>3.1. 어휘 : 출퇴근 자율 제도, 정하다, 업무, 효율성, 함께, 만족도, 매출, 친환경, 마크, 농약, 소비자, 반응, 기준, 적용하다, 엄격하다</p>

</div><p class="curri-text1">4. 과제 : 오늘 배운 어휘와 표현을 활용하여, 자유롭게 작문을 해보세요. 다음 강의의 선생님은 과제를 확인해 주세요.</p>

</body>
</html>'}])

course = Course.create!([{lang: 'Korean', rank: '초급', subject: 'Ch1 langD에 관한 연구1k.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Korean', rank: '초급', subject: 'Ch2 langD에 관한 연구2k.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Korean', rank: '초급', subject: 'Ch3 langD에 관한 연구3k.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Korean', rank: '중급', subject: 'Ch1 langD에 관한 해석1k.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Korean', rank: '중급', subject: 'Ch2 langD에 관한 해석2k.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Korean', rank: '중급', subject: 'Ch3 langD에 관한 해석3k.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Korean', rank: '고급', subject: 'Ch1 langD에 관한 응용1k.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Korean', rank: '고급', subject: 'Ch2 langD에 관한 응용2k.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Korean', rank: '고급', subject: 'Ch3 langD에 관한 응용3k.', content: '<p>nothing special</p>'}])

course = Course.create!([{lang: 'English', rank: '초급', subject: 'Ch1 langD에 관한 연구1e.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'English', rank: '초급', subject: 'Ch2 langD에 관한 연구2e.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'English', rank: '초급', subject: 'Ch3 langD에 관한 연구3e.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'English', rank: '중급', subject: 'Ch1 langD에 관한 해석1e.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'English', rank: '중급', subject: 'Ch2 langD에 관한 해석2e.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'English', rank: '중급', subject: 'Ch3 langD에 관한 해석3e.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'English', rank: '고급', subject: 'Ch1 langD에 관한 응용1e.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'English', rank: '고급', subject: 'Ch2 langD에 관한 응용2e.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'English', rank: '고급', subject: 'Ch3 langD에 관한 응용3e.', content: '<p>nothing special</p>'}])

course = Course.create!([{lang: 'Chinese', rank: '초급', subject: 'Ch1 langD에 관한 연구1c.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Chinese', rank: '초급', subject: 'Ch2 langD에 관한 연구2c.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Chinese', rank: '초급', subject: 'Ch3 langD에 관한 연구3c.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Chinese', rank: '중급', subject: 'Ch1 langD에 관한 해석1c.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Chinese', rank: '중급', subject: 'Ch2 langD에 관한 해석2c.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Chinese', rank: '중급', subject: 'Ch3 langD에 관한 해석3c.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Chinese', rank: '고급', subject: 'Ch1 langD에 관한 응용1c.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Chinese', rank: '고급', subject: 'Ch2 langD에 관한 응용2c.', content: '<p>nothing special</p>'}])
course = Course.create!([{lang: 'Chinese', rank: '고급', subject: 'Ch3 langD에 관한 응용3c.', content: '<p>nothing special</p>'}])
