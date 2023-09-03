class FilesController < ApplicationController
    def index
      s3 = Aws::S3::Resource.new
      @files = s3.bucket('starlord-dev').objects
    end

    def upload
      s3 = Aws::S3::Resource.new
      file = params[:file]
      s3.bucket('starlord-dev').object(file.original_filename).upload_file(file.path)
      redirect_to files_path
    end

    def delete
      s3 = Aws::S3::Resource.new
      s3.bucket('starlord-dev').object(params[:file_name]).delete
      redirect_to files_path
    end
  end
