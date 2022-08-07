class PostSummarySerializer < ActiveModel::Serializer
  attributes :content
  
  def summary
    "short_content: #{self.content[0..39]}..."
  end
end
