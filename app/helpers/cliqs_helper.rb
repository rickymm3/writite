module CliqsHelper

  def generate_cliq_history(parent_cliq)
    render 'cliqs/cliqfun', ancestors: get_cliq_ancestors(parent_cliq)
  end

  def get_cliq_ancestors(parent_cliq)
    ancestors = parent_cliq.ancestors
    ancestors << parent_cliq
    ancestors
  end

end
