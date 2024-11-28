class TennisGame:
    def __init__(self, player1_name, player2_name):
        self.player1_name = player1_name
        self.player2_name = player2_name
        self.player1_score = 0
        self.player2_score = 0

    def won_point(self, player_name):
        if player_name == "player1":
            self.player1_score += 1
        else:
            self.player2_score += 1

    def same_score(self, current_score):
        if current_score == 0:
            score = "Love-All"
        elif current_score == 1:
            score = "Fifteen-All"
        elif current_score == 2:
            score = "Thirty-All"
        else:
            score = "Deuce"
        return score

    def advantage_or_win(self, difference):
        if difference == 1:
            score = "Advantage player1"
        elif difference == -1:
            score = "Advantage player2"
        elif difference >= 2:
            score = "Win for player1"
        else:
            score = "Win for player2"
        return score

    def temporary_score(self, score, player_score):
        if player_score == 0:
            score = score + "Love"
        elif player_score == 1:
            score = score + "Fifteen"
        elif player_score == 2:
            score = score + "Thirty"
        elif player_score == 3:
            score = score + "Forty"
        return score

    def get_score(self):
        score = ""
        temp_score = 0

        if self.player1_score == self.player2_score:
            return self.same_score(self.player1_score)

        elif self.player1_score >= 4 or self.player2_score >= 4:
            difference = self.player1_score - self.player2_score
            return self.advantage_or_win(difference)

        else:
            for i in range(1, 3):
                if i == 1:
                    temp_score = self.player1_score
                else:
                    score = score + "-"
                    temp_score = self.player2_score

                score = self.temporary_score(score, temp_score)

        return score
