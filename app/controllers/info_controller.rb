class InfoController < ApplicationController
  layout false
  def status
    version = get_revision
    respond_to do |format|
      format.html {render text: "version = #{version}\n env = #{Rails.env}\n hostname = #{`hostname`}"}
      format.json {render json: {version: version, environment: Rails.env, hostname: `hostname`}}
    end
  end

  private
  def get_revision
    version = ""
    begin
      version = File.read("REVISION")
    rescue
      version = "UNKNOWN"
    end
    version
  end
end
