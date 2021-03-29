module ApplicationHelper
  def gamer_choices
    session['gamer_choices']
  end

  def computer_choices
    session['computer_choices']
  end
end