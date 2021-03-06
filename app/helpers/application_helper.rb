module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, { :sort => column, :direction => direction }, { :class => css_class }
  end

  def new_chapter_number(story)
    Chapter.where(mystory_id: story.id).count + 1
  end

  def next_chapter(story, chapter_number)
    next_chapter_number = chapter_number+1
    Chapter.where(mystory_id: story.id, number:next_chapter_number).first
  end

  def facebook_image(uid)
    "http://graph.facebook.com/#{uid}/picture"
  end

  def user_owned?
    if current_user
      current_user.id == @story.user_id
    end
  end

  def num_of_chapters(story)
    Mystory.find(story.id).chapters.count
  end

  def get_published(story)
    story.chapters.count {|chapter| chapter.published.is_true?}
  end

  def get_drafts(story)
    story.chapters.count {|chapter| chapter.published.is_false?}
  end

end