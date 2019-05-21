module PostHelper
    def get_username(user_id)
        return User.find(user_id)
    end

    def clean_url(url)
        return url.sub(/^https?\:\/\/(www.)?/, '').split("/")[0]
    end

    def display_points_count(post)
        # Render the number of points associated with a post in the view
        points_count = post.cached_votes_up
        if points_count == 0
            ""
        elsif points_count == 1
            "1 point"
        else
            "#{points_count.to_s} points"
        end
    end

    def display_comment_count(post)
        # Render the number of comments associated with a post in the view.
        comment_count = post.comments.size
        if comment_count == 0
            "comments"
        elsif comment_count == 1
            "1 comment"
        else
            "#{comment_count.to_s} comments"
        end
    end

    def get_page_start(page_number)
        # Display the correct post number while paginating through posts
        if page_number == nil
            "1"
        elsif page_number.to_i > 1
            start = (page_number.to_i * 30) - 29
            start.to_s
        end
    end
end
