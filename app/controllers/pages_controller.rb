class PagesController < ApplicationController
    #set controller for each page
    def home   
        @basic_plan = Plan.find(1)
        @pro_plan = Plan.find(2)
    end
    
    def about
    end
end