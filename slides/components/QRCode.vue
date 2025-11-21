<script setup lang="ts">
import { ref, onMounted, watch } from 'vue'
import qrcode from 'qrcode-generator'

const props = defineProps<{
  url: string
  size?: number
  caption?: string
  options?: Record<string, any>
}>()

const qrSvg = ref<string>('')
const error = ref<string>('')
const size = props.size ?? 200

const generateQRCode = () => {
  try {
    const typeNumber = 0 // Auto detect
    const errorCorrectionLevel = 'M'
    const qr = qrcode(typeNumber, errorCorrectionLevel)
    qr.addData(props.url)
    qr.make()
    
    const cellSize = Math.floor(size / qr.getModuleCount())
    const margin = 2
    const totalSize = qr.getModuleCount() * cellSize + margin * 2
    
    let svg = `<svg width="${totalSize}" height="${totalSize}" xmlns="http://www.w3.org/2000/svg">`
    svg += `<rect width="${totalSize}" height="${totalSize}" fill="white"/>`
    
    for (let row = 0; row < qr.getModuleCount(); row++) {
      for (let col = 0; col < qr.getModuleCount(); col++) {
        if (qr.isDark(row, col)) {
          svg += `<rect x="${col * cellSize + margin}" y="${row * cellSize + margin}" width="${cellSize}" height="${cellSize}" fill="black"/>`
        }
      }
    }
    
    svg += '</svg>'
    qrSvg.value = svg
    error.value = ''
  } catch (err) {
    error.value = err instanceof Error ? err.message : 'Failed to generate QR code'
    console.error('QR Code generation error:', err)
  }
}

onMounted(() => {
  generateQRCode()
})

watch(() => props.url, () => {
  generateQRCode()
})

watch(() => props.size, () => {
  generateQRCode()
})
</script>

<template>
  <div class="flex flex-col items-center">
    <div v-if="error" class="text-red-500">
      {{ error }}
    </div>
    <div
      v-else-if="qrSvg"
      v-html="qrSvg"
      class="border border-gray-300 rounded"
    />
    <div v-else class="text-gray-400">
      Generating QR code...
    </div>
    <p v-if="caption" class="mt-2 text-sm text-gray-600">
      {{ caption }}
    </p>
  </div>
</template>
