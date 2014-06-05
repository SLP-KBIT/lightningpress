# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Member
ookawa = Member.create(name: "大川 昌寛", student_number: "s09t214", account: "ookawa", password: "password", password_confirmation: "password", is_admin: true)
engineer = Member.create(name: "Engineer", student_number: "s00t200", account: "engineer", password: "slp", password_confirmation: "slp", is_admin: true)
anyone = Member.create(name: "Anyone", student_number: "s00t000", account: "anyone", password: "lt", password_confirmation: "lt", is_admin: false)

#Lightningtalk
slp =  Lightningtalk.create(name: "SLP", member_id:  anyone.id, sumally: "SLPの活動について", performance_date: Date.today.tomorrow )

#Ltcomment
LtComment.create(member_id: anyone.id, content: "foo", lightningtalk_id: slp.id)

#Request
slp_request = Request.create(contributor_id: engineer.id, title: "SLP", content: "SLPの活動について", presenter_id: anyone.id ,status: 2)
cem_request = Request.create(contributor_id: engineer.id, title: "CEM", content: "CEMの活動報告", presenter_id: nil, status: 0)
labo_request = Request.create(contributor_id: engineer.id, title: "Labo", content: "研究室体験について", presenter_id: nil, status: 1)

#Requestcomment
RequestComment.create(member_id: anyone.id, content: "hoge2014", request_id: slp_request.id)

#Candidate
Candidate.create(request_id: cem_request.id, member_id: anyone.id)

#Ltpreference
#LtPreference.create(lightningtalk_id:slp.id, grade:3, member_id:engineer.id)
#RequestPreference.create(request_id:slp_request.id, grade:0, member_id:ookawa.id)
#RequestNotification.create(receiver_id:anyone.id, request_id:labo_request.id, response_status:0)
