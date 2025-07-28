package com.iloatnew.template.ui.res

import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Shapes
import androidx.compose.material3.Typography
import androidx.compose.material3.lightColorScheme
import androidx.compose.runtime.Composable

@Composable
fun AppTheme(
    content: @Composable () -> Unit
) {
    MaterialTheme(
        colorScheme = lightColorScheme(),
        shapes = appShapes,
        typography = appTypography,
        content = content
    )
}

val appShapes = Shapes()

val appTypography = Typography()
