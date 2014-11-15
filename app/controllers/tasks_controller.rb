class TasksController < ApplicationController
	def index
		@tasks=Task.order("position")
        @task=Task.new
	end

    #def show
     #   @task = Task.find(params[:id])
    #end

    #def new
        
   # end

	def create
		@task = Task.create(task_params)
		#@task.save
		redirect_to :tasks
	end

#    def update
 #       @task = task.find(params[:id])
  #      if @task.update_attributes(params[:task])
   #         redirect_to @task, notice: "Success"
    #    else
     #       render :edit
      #  end
    #end

	def destroy
        @task = Task.find(params[:id])
        @task.destroy
        render :json => {:task=>@task}
        #redirect_to :tasks
    end
    def toggle
    	render nothing: true
    	@task=Task.find(params[:id])
    	@task.done=!@task.done
    	@task.save
    end

    def sort
        #params[:task].each_with_index do |id, index| 
        #task_params.each_with_index do |id, index| 
        params[:task].each_with_index do |id,i|         
            Task.find(id).update(position: i+1)
            Task.find(id).update(line: 1)
        end
         #   Task.update_all({position: index+1}, {id: id})
        #end
        render nothing: true
    end
private
        def task_params
            params[:task].permit(:title,:position)
        end
end