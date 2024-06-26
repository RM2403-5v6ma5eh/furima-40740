module Faker
  class JapaneseName < Base
    class << self
      def last_name
        last_names.sample
      end

      def first_name
        first_names.sample
      end

      def last_name_kana
        last_names_kana.sample
      end

      def first_name_kana
        first_names_kana.sample
      end

      def last_names
        %w[佐藤 鈴木 高橋 田中 渡辺 伊藤 山本 中村 小林 加藤 吉田 山田 佐々木キ 山口 松本 井上 木村 林 斎藤 清水]
      end

      def first_names
        %w[太郎 花子 隆一 綾香 真一 正美 良太 あゆみ ひろし 麻衣 健太 雅子 直樹 正美 寛子]
      end

      def last_names_kana
        %w[サトウ スズキ タカハシ タナカ ワタナベ イトウ ヤマモト ナカムラ コバヤシ カトウ ヨシダ ヤマダ ササキ ヤマグチ マツモト イノウエ キムラ ハヤシ サイトウ シミズ]
      end

      def first_names_kana
        %w[タロウ ハナコ リュウイチ アヤカ シンイチ マサミ リョウタ アユミ ヒロシ マイ ケンタ マサコ ナオキ マサミ ヒロコ]
      end
    end
  end
end