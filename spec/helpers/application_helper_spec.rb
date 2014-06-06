require 'spec_helper'

describe ApplicationHelper do
	describe "full_title" do
		it "should include the page title" do
			expect(full_title("foo")).to match(/foo/)
		end

		it "should include base title" do
			expect(full_title("foo")).to match(/Twitter Clone Tutorial/)
		end

		it "shouldn't have a bar for the home page" do
			expect(full_title("")).not_to match(/\|/)
		end
	end
end