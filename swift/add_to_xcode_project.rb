#!/usr/bin/env ruby

require 'xcodeproj'

# Xcode 프로젝트 파일의 상대 경로
project_path = 'Algorithm.xcodeproj'

# 추가할 Swift 파일의 상대 경로와 난이도
swift_file_path = ARGV[0]
difficulty = ARGV[1]

# Xcode 프로젝트 열기
project = Xcodeproj::Project.open(project_path)

# 프로젝트의 첫 번째 타겟 가져오기
target = project.targets.first

# "Algorithm" 그룹 찾기
algorithm_group = project.main_group.find_subpath('Algorithm', true)

# "Algorithm" 그룹 찾기
leetcode_group = algorithm_group.find_subpath('LeetCode', true)

# 난이도에 따라 해당 그룹 찾기 또는 생성하기
difficulty_group = leetcode_group.find_subpath(difficulty, true)

# 새 파일을 난이도 그룹에 추가
file_ref = difficulty_group.new_reference(swift_file_path)
target.add_file_references([file_ref])

# 프로젝트 저장
project.save