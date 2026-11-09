class PlayerStats:
    def __init__(self, reader):
        self.reader = reader

    def get_points(self, player):
        return player.points

    def top_scorers_by_nationality(self, nationality):
        players = []

        for player in self.reader.get_players():
            if player.nationality == nationality:
                players.append(player)

        players.sort(key=self.get_points, reverse=True)

        return players