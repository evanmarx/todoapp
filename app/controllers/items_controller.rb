class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new

		render :new
	end

	def create
		@item = Item.new(params[:item])

		if @item.save
			flash.notice = "Task Saved"
			redirect_to project_url(@item.project)
		else
			render :new
		end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		@item.update_attributes(params[:item])

		if @item.save
			flash.notice = "Item Saved"
			redirect_to project_url(@item.project)
		else
			render :edit
		end
	end

	def destroy
		Item.find(params[:id]).destroy
	end
end