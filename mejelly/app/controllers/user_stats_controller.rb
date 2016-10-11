class UserStatsController < ApplicationController
  def index
    @total_users=User.all.count
    @no_of_admins=User.where(is_admin: true).count
    @no_of_active_memebers=User.where.not(is_admin: true).count
    @no_of_banned_memebers=User.where(is_banned: true).count
    @registered_last_7days=User.where("created_at >= ? ",(Date.today - 7.days)).count
   # @registered_last_30days=User.where("created_at >= ? ",(Date.today - 30.days)).count

   # @registered_last_90days=User.where("created_at >= ? ",(Date.today - 90.days)).count
  end
end