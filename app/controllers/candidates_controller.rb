class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to candidates_path, notice: "新增候選人成功！"
    else
      render :new
    end
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end
  
  private
  def candidate_params
    params.require(:candidate).permit(:name, :age, :political_party, :politics)
  end

end
