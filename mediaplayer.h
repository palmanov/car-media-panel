#ifndef MEDIAPLAYER_H
#define MEDIAPLAYER_H

#include <QObject>
#include <QMediaPlayer>

class MediaPlayer : public QMediaPlayer
{
    Q_OBJECT
public:
    MediaPlayer();
};

#endif // MEDIAPLAYER_H
