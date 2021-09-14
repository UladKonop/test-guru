# frozen_string_literal: true

module Version
  extend TestGuru

  def TestGuru.version
    @version ||= '0.0.0'
  end

  def TestGuru.version=(str)
    @version = str
  end
end
