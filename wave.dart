import 'dart:typed_data';

class Wave {
  Uint8List chunkID;
  Uint8List chunkSize;
  Uint8List format;
  Uint8List subchunk1ID;
  Uint8List subchunk1Size;
  Uint8List audioFormat;
  Uint8List numChannels;
  Uint8List sampleRate;
  Uint8List byteRate;
  Uint8List blockAlign;
  Uint8List bitsPerSample;
  Uint8List subchunk2ID;
  Uint8List subchunk2Size;
  Uint8List data;

  Wave(
      this.chunkID,
      this.chunkSize,
      this.format,
      this.subchunk1ID,
      this.subchunk1Size,
      this.audioFormat,
      this.numChannels,
      this.sampleRate,
      this.byteRate,
      this.blockAlign,
      this.bitsPerSample,
      this.subchunk2ID,
      this.subchunk2Size,
      this.data);

  factory Wave.fromBytes(List<int> bytes) {
    Uint8List chunkID = Uint8List(4);
    Uint8List chunkSize = Uint8List(4);
    Uint8List format = Uint8List(4);
    Uint8List subchunk1ID = Uint8List(4);
    Uint8List subchunk1Size = Uint8List(4);
    Uint8List audioFormat = Uint8List(2);
    Uint8List numChannels = Uint8List(2);
    Uint8List sampleRate = Uint8List(4);
    Uint8List byteRate = Uint8List(4);
    Uint8List blockAlign = Uint8List(2);
    Uint8List bitsPerSample = Uint8List(2);
    Uint8List subchunk2ID = Uint8List(4);
    Uint8List subchunk2Size = Uint8List(4);
    Uint8List data;

    int index = 0;
    for (int i = 0; i < chunkID.length; index++, i++)
      chunkID[i] = (bytes[index]);
    for (int i = 0; i < chunkSize.length; index++, i++)
      chunkSize[i] = bytes[index];
    for (int i = 0; i < format.length; index++, i++)
      format[i] = bytes[index];
    for (int i = 0; i < subchunk1ID.length; index++, i++)
      subchunk1ID[i] = bytes[index];
    for (int i = 0; i < subchunk1Size.length; index++, i++)
      subchunk1Size[i] = bytes[index];
    for (int i = 0; i < audioFormat.length; index++, i++)
      audioFormat[i] = bytes[index];
    for (int i = 0; i < numChannels.length; index++, i++)
      numChannels[i] = bytes[index];
    for (int i = 0; i < sampleRate.length; index++, i++)
      sampleRate[i] = bytes[index];
    for (int i = 0; i < byteRate.length; index++, i++)
      byteRate[i] = bytes[index];
    for (int i = 0; i < blockAlign.length; index++, i++)
      blockAlign[i] = bytes[index];
    for (int i = 0; i < bitsPerSample.length; index++, i++)
      bitsPerSample[i] = bytes[index];
    for (int i = 0; i < subchunk2ID.length; index++, i++)
      subchunk2ID[i] = bytes[index];
    for (int i = 0; i < subchunk2Size.length; index++, i++)
      subchunk2Size[i] = bytes[index];

    data = Uint8List(bytes.length - index);
    for (int i = 0; i < data.length; index++, i++) data[i] = bytes[index];

    return Wave(
      chunkID,
      chunkSize,
      format,
      subchunk1ID,
      subchunk1Size,
      audioFormat,
      numChannels,
      sampleRate,
      byteRate,
      blockAlign,
      bitsPerSample,
      subchunk2ID,
      subchunk2Size,
      data,
    );
  }
}
